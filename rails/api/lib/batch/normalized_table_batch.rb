module Batch
  class NormalizedTableBatch
    SLICE_SIZE = 10_000

    def self.transport
      raise '[INFO] Not runnable method'
    end

    def self.destroy_all
      raise '[INFO] Not runnable method'
    end

    def self.map_to_normalized_model(constructor, work_models)
      {
        transform: constructor,
        source: work_models
      }
    end

    def self.import_to_normalized_table(model_name, mapper, batch_size: SLICE_SIZE, **options)
      work = options[:work]

      ApplicationRecord.transaction do
        unless work.blank? || work.to_s.classify.constantize.exists?
          raise ActiveRecord::RecordNotFound, "#{work.tableize}にレコードがありません。"
        end

        source = mapper[:source]
        transform = mapper[:transform]

        common_bulk_import(
          model_name,
          batch_size,
          options,
          source,
          transform
        )
      end
    end

    def self.common_bulk_import(model_name, batch_size, options, source, transform)
      validate = options.fetch(:validate, true)
      on_duplicate_key_update = options[:on_duplicate_key_update]
      on_duplicate_key_ignore = options[:on_duplicate_key_ignore]
      target_date = options[:target_date]

      if source.is_a? Array
        source.each_slice(batch_size) do |models|
          exports = if transform.nil?
                      models
                    else
                      models.map do |m|
                        target_date ? transform.call(m, target_date) : transform.call(m)
                      end
                    end
          model_name.constantize.import exports,
                                        validate: validate,
                                        on_duplicate_key_update: on_duplicate_key_update,
                                        on_duplicate_key_ignore: on_duplicate_key_ignore
        end

        save_status(options[:resource_registration]) if source.present?

        return
      end

      offset = 0
      source_exists = false

      loop do
        models = source.offset(offset).limit(batch_size).map do |m|
          target_date ? transform.call(m, target_date) : transform.call(m)
        end
        break if models.blank?

        model_name.constantize.import models,
                                      validate: validate,
                                      on_duplicate_key_update: on_duplicate_key_update,
                                      on_duplicate_key_ignore: on_duplicate_key_ignore
        offset += batch_size
        source_exists = true
      end

      save_status(options[:resource_registration]) if source_exists
    end

    def self.save_status(resource_registration)
      return unless resource_registration

      self::RESOURCE_NAMES.each do |name|
        status = ResourceStatus.find_or_initialize_by(type: 'api'.freeze, name: name)
        status.last_updated_at = Time.zone.now
        status.save!
      end
    end

    private_class_method :save_status
  end
end
