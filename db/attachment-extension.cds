using {sap.cap.store.Notebook } from './schema';
using {sap.attachments.Attachments} from`com.sap.cds/sdm`;

extend entity Notebook with {
    attachments : Composition of many Attachments;
}
