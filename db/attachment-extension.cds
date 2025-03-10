using {sap.cap.store.Notebook } from '../db/schema.cds';
using {sap.attachments.Attachments} from`com.sap.cds/sdm`;

extend entity Notebook with {
   attachments : Composition of many Attachments;
}