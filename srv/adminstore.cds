using {ADMIN_SERVICE as external} from './external/ADMIN_SERVICE';

service adminstore {
  entity localbooks      as
    projection on external.Books {
          *,
      key ID    as ID,
          price as price,
          stock as stock,
          image as image,

    }
    excluding {
      attachments_up__ID,
      attachments_ID,
      texts_ID_texts,
      attachments_IsActiveEntity,
      texts_IsActiveEntity
    };

  entity localattachment as
    projection on external.Books_attachments {
      *
    };
}
