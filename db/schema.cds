using { cuid } from '@sap/cds/common';

namespace sap.cap.store;

entity Notebook : cuid {
  @mandatory title  : localized String(111);
  descr             : localized String(1111);
  @mandatory writer : Association to Writer;
  stock             : Integer;
  price             : Decimal;
}

entity Writer : cuid {
  @mandatory name : String(111);
  dateOfBirth     : Date;
  placeOfBirth    : String;
  notebooks       : Association to many Notebook
                      on notebooks.writer = $self;
}