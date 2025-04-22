using {sap.cap.store as my} from '../db/schema';
using { ADMIN_SERVICE as externala } from './external/ADMIN_SERVICE';
using { CATALOG_SERVICE as external } from './external/CATALOG_SERVICE';

service storeservice {
  entity Notebooks as projection on my.Notebook ;
  entity Writers as projection on my.Writer;
  entity localbooks as projection on externala.Books {
  *
  } excluding {attachments_up__ID, attachments_ID,texts_ID_texts,attachments_IsActiveEntity, texts_IsActiveEntity};
  // entity localbooks as projection on external.Books {
  // ID,title,descr,stock,price,currency_code,attachments
  // }
  // entity localbooks as projection on external.Books;
  entity localattachment as projection on externala.Books_attachments;
}
