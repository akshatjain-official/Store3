using {sap.cap.store as my} from '../db/schema';
using { CATALOG_SERVICE as external } from './external/CATALOG_SERVICE';

service Storeservice {
  entity Notebooks as projection on my.Notebook;
  entity Writers as projection on my.Writer;
  entity localbooks as projection on external.Books;
  entity localattachment as projection on external.Books_attachments;
}