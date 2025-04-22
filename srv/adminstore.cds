using {sap.cap.store as my} from '../db/schema';
using { ADMIN_SERVICE as externala } from './external/ADMIN_SERVICE';

service adminstore {
   entity localbooks as projection on externala.Books {
  *
  } excluding {attachments_up__ID, attachments_ID,texts_ID_texts,attachments_IsActiveEntity,texts_IsActiveEntity};

}
