using {sap.cap.store as my} from '../db/schema';

service StoreService {
  entity Notebooks as projection on my.Notebook;
  entity Writers as projection on my.Writer;
}