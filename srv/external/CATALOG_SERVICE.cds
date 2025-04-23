/* checksum : 1bb3732d0189a27cc825db104f18543e */
@cds.external : true
action CATALOG_SERVICE.submitOrder(
  @Common.SemanticObject : 'Books'
  @Common.Text : title
  @Common.Text.@UI.TextArrangement : #TextOnly
  @Common.Label : 'ID'
  book : UUID,
  quantity : Integer
) returns CATALOG_SERVICE.return_CatalogService_submitOrder;

/** For displaying lists of Books */
@cds.external : true
@cds.persistence.skip : true
@UI.HeaderInfo : {
  $Type: 'UI.HeaderInfoType',
  TypeName: 'Book',
  TypeNamePlural: 'Books',
  Description: {
    $Type: 'UI.DataField',
    Value: author
  },
  Title: {
    $Type: 'UI.DataField',
    Value: title
  }
}
@UI.HeaderFacets : [
  {
    $Type: 'UI.ReferenceFacet',
    Label: 'Description',
    Target: @UI.![FieldGroup#Descr]
  }
]
@UI.Facets : [
  {
    $Type: 'UI.ReferenceFacet',
    Label: '{i18n>Details}',
    Target: @UI.![FieldGroup#Price]
  }
]
@UI.FieldGroup#Descr : {
  $Type: 'UI.FieldGroupType',
  Data: [
    {
      $Type: 'UI.DataField',
      Value: descr
    }
  ]
}
@UI.FieldGroup#Price : {
  $Type: 'UI.FieldGroupType',
  Data: [
    {
      $Type: 'UI.DataField',
      Value: price
    },
    {
      $Type: 'UI.DataField',
      Value: ![currency/symbol],
      Label: 'Currency'
    }
  ]
}
@UI.SelectionFields : [ 'ID', 'price', 'currency_code' ]
@UI.LineItem : [
  {
    $Type: 'UI.DataField',
    Value: ID,
    Label: 'Title'
  },
  {
    $Type: 'UI.DataField',
    Value: author,
    Label: 'Author'
  },
  {
    $Type: 'UI.DataField',
    Value: ![genre/name]
  },
  {
    $Type: 'UI.DataField',
    Value: price
  },
  {
    $Type: 'UI.DataField',
    Value: ![currency/symbol]
  }
]
@UI.Identification : [
  {
    $Type: 'UI.DataField',
    Value: title
  }
]
@Common.SemanticKey : [ 'ID' ]
@Capabilities.DeleteRestrictions.Deletable : false
@Capabilities.InsertRestrictions.Insertable : false
@Capabilities.UpdateRestrictions.Updatable : false
entity CATALOG_SERVICE.ListOfBooks {
  @odata.Precision : 7
  @odata.Type : 'Edm.DateTimeOffset'
  @UI.HiddenFilter : true
  @UI.ExcludeFromNavigationContext : true
  @Core.Immutable : true
  @Core.Computed : true
  @Common.Label : 'Created On'
  createdAt : Timestamp;
  @odata.Precision : 7
  @odata.Type : 'Edm.DateTimeOffset'
  @UI.HiddenFilter : true
  @UI.ExcludeFromNavigationContext : true
  @Core.Computed : true
  @Common.Label : 'Changed On'
  modifiedAt : Timestamp;
  @Common.SemanticObject : 'Books'
  @Common.Text : title
  @Common.Text.@UI.TextArrangement : #TextOnly
  @Common.Label : 'ID'
  @Core.ComputedDefaultValue : true
  key ID : UUID not null;
  @Common.Label : 'Title'
  @Common.FieldControl : #Mandatory
  title : String(111);
  @Common.Label : 'Name'
  @Common.FieldControl : #Mandatory
  author : String(111);
  @cds.ambiguous : 'missing on condition?'
  @Common.Label : 'Genre'
  genre : Association to one CATALOG_SERVICE.Genres on genre.ID = genre_ID;
  @Common.Text : ![genre/name]
  @Common.Text.@UI.TextArrangement : #TextOnly
  @Common.Label : 'Genre'
  @Common.ValueList : {
    $Type: 'Common.ValueListType',
    Label: 'Genre',
    CollectionPath: 'Genres',
    Parameters: [
      {
        $Type: 'Common.ValueListParameterInOut',
        LocalDataProperty: genre_ID,
        ValueListProperty: 'ID'
      },
      {
        $Type: 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'name'
      }
    ]
  }
  genre_ID : Integer;
  @Common.Label : 'Stock'
  stock : Integer;
  @Measures.ISOCurrency : currency_code
  @Common.Label : 'Price'
  price : Decimal;
  /** A currency code as specified in ISO 4217 */
  @cds.ambiguous : 'missing on condition?'
  @Common.Label : 'Currency'
  currency : Association to one CATALOG_SERVICE.Currencies on currency.code = currency_code;
  /** A currency code as specified in ISO 4217 */
  @Common.Label : 'Currency'
  @Common.ValueList : {
    $Type: 'Common.ValueListType',
    Label: 'Currency',
    CollectionPath: 'Currencies',
    Parameters: [
      {
        $Type: 'Common.ValueListParameterInOut',
        LocalDataProperty: currency_code,
        ValueListProperty: 'code'
      },
      {
        $Type: 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'name'
      }
    ]
  }
  currency_code : String(3);
  @Core.MediaType : 'image/png'
  @odata.Type : 'Edm.Stream'
  @Common.Label : '{i18n>Image}'
  image : LargeBinary;
  @cds.ambiguous : 'missing on condition?'
  attachments : Composition of many CATALOG_SERVICE.Books_attachments on attachments.up__ID = ID;
  @cds.ambiguous : 'missing on condition?'
  texts : Composition of many CATALOG_SERVICE.Books_texts;
  @cds.ambiguous : 'missing on condition?'
  localized : Association to one CATALOG_SERVICE.Books_texts {  };
};

/** For display in details pages */
@cds.external : true
@cds.persistence.skip : true
@UI.HeaderInfo : {
  $Type: 'UI.HeaderInfoType',
  TypeName: 'Book',
  TypeNamePlural: 'Books',
  Description: {
    $Type: 'UI.DataField',
    Value: author
  },
  Title: {
    $Type: 'UI.DataField',
    Value: title
  }
}
@UI.HeaderFacets : [
  {
    $Type: 'UI.ReferenceFacet',
    Label: 'Description',
    Target: @UI.![FieldGroup#Descr]
  }
]
@UI.Facets : [
  {
    $Type: 'UI.ReferenceFacet',
    Label: '{i18n>Details}',
    Target: @UI.![FieldGroup#Price]
  }
]
@UI.FieldGroup#Descr : {
  $Type: 'UI.FieldGroupType',
  Data: [
    {
      $Type: 'UI.DataField',
      Value: descr
    }
  ]
}
@UI.FieldGroup#Price : {
  $Type: 'UI.FieldGroupType',
  Data: [
    {
      $Type: 'UI.DataField',
      Value: price
    },
    {
      $Type: 'UI.DataField',
      Value: ![currency/symbol],
      Label: 'Currency'
    }
  ]
}
@UI.SelectionFields : [ 'ID', 'price', 'currency_code' ]
@UI.LineItem : [
  {
    $Type: 'UI.DataField',
    Value: ID,
    Label: 'Title'
  },
  {
    $Type: 'UI.DataField',
    Value: author,
    Label: 'Author'
  },
  {
    $Type: 'UI.DataField',
    Value: ![genre/name]
  },
  {
    $Type: 'UI.DataField',
    Value: price
  },
  {
    $Type: 'UI.DataField',
    Value: ![currency/symbol]
  }
]
@UI.Identification : [
  {
    $Type: 'UI.DataField',
    Value: title
  }
]
@Common.SemanticKey : [ 'ID' ]
@Capabilities.DeleteRestrictions.Deletable : false
@Capabilities.InsertRestrictions.Insertable : false
@Capabilities.UpdateRestrictions.Updatable : false
entity CATALOG_SERVICE.Books {
  @odata.Precision : 7
  @odata.Type : 'Edm.DateTimeOffset'
  @UI.HiddenFilter : true
  @UI.ExcludeFromNavigationContext : true
  @Core.Immutable : true
  @Core.Computed : true
  @Common.Label : 'Created On'
  createdAt : Timestamp;
  @odata.Precision : 7
  @odata.Type : 'Edm.DateTimeOffset'
  @UI.HiddenFilter : true
  @UI.ExcludeFromNavigationContext : true
  @Core.Computed : true
  @Common.Label : 'Changed On'
  modifiedAt : Timestamp;
  @Common.SemanticObject : 'Books'
  @Common.Text : title
  @Common.Text.@UI.TextArrangement : #TextOnly
  @Common.Label : 'ID'
  @Core.ComputedDefaultValue : true
  key ID : UUID not null;
  @Common.Label : 'Title'
  @Common.FieldControl : #Mandatory
  title : String(111);
  @UI.MultiLineText : true
  @Common.Label : 'Description'
  descr : String(1111);
  @Common.Label : 'Name'
  @Common.FieldControl : #Mandatory
  author : String(111);
  @cds.ambiguous : 'missing on condition?'
  @Common.Label : 'Genre'
  genre : Association to one CATALOG_SERVICE.Genres on genre.ID = genre_ID;
  @Common.Text : ![genre/name]
  @Common.Text.@UI.TextArrangement : #TextOnly
  @Common.Label : 'Genre'
  @Common.ValueList : {
    $Type: 'Common.ValueListType',
    Label: 'Genre',
    CollectionPath: 'Genres',
    Parameters: [
      {
        $Type: 'Common.ValueListParameterInOut',
        LocalDataProperty: genre_ID,
        ValueListProperty: 'ID'
      },
      {
        $Type: 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'name'
      }
    ]
  }
  genre_ID : Integer;
  @Common.Label : 'Stock'
  stock : Integer;
  @Measures.ISOCurrency : currency_code
  @Common.Label : 'Price'
  price : Decimal;
  /** A currency code as specified in ISO 4217 */
  @cds.ambiguous : 'missing on condition?'
  @Common.Label : 'Currency'
  currency : Association to one CATALOG_SERVICE.Currencies on currency.code = currency_code;
  /** A currency code as specified in ISO 4217 */
  @Common.Label : 'Currency'
  @Common.ValueList : {
    $Type: 'Common.ValueListType',
    Label: 'Currency',
    CollectionPath: 'Currencies',
    Parameters: [
      {
        $Type: 'Common.ValueListParameterInOut',
        LocalDataProperty: currency_code,
        ValueListProperty: 'code'
      },
      {
        $Type: 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'name'
      }
    ]
  }
  currency_code : String(3);
  @Core.MediaType : 'image/png'
  @odata.Type : 'Edm.Stream'
  @Common.Label : '{i18n>Image}'
  image : LargeBinary;
  @cds.ambiguous : 'missing on condition?'
  attachments : Composition of many CATALOG_SERVICE.Books_attachments on attachments.up__ID = ID;
  @cds.ambiguous : 'missing on condition?'
  texts : Composition of many CATALOG_SERVICE.Books_texts;
  @cds.ambiguous : 'missing on condition?'
  localized : Association to one CATALOG_SERVICE.Books_texts {  };
};

/** Hierarchically organized Code List for Genres */
@cds.external : true
@cds.persistence.skip : true
@Common.SemanticKey : [ 'name' ]
@UI.SelectionFields : [ 'name' ]
@UI.LineItem : [
  {
    $Type: 'UI.DataField',
    Value: name
  },
  {
    $Type: 'UI.DataField',
    Value: ![parent/name],
    Label: 'Main Genre'
  }
]
@UI.Identification : [
  {
    $Type: 'UI.DataField',
    Value: name
  }
]
@UI.HeaderInfo : {
  $Type: 'UI.HeaderInfoType',
  TypeName: 'Genre',
  TypeNamePlural: '{i18n>Genres}',
  Title: {
    $Type: 'UI.DataField',
    Value: name
  },
  Description: {
    $Type: 'UI.DataField',
    Value: ID
  }
}
@UI.Facets : [
  {
    $Type: 'UI.ReferenceFacet',
    Label: '{i18n>SubGenres}',
    Target: children.![@UI].LineItem
  }
]
entity CATALOG_SERVICE.Genres {
  @Common.Label : 'Genre'
  name : String(255);
  @Common.Label : 'Description'
  descr : String(1000);
  @Common.Text : name
  @Common.Text.@UI.TextArrangement : #TextOnly
  @Common.Label : 'ID'
  key ID : Integer not null;
  @cds.ambiguous : 'missing on condition?'
  parent : Association to one CATALOG_SERVICE.Genres on parent.ID = parent_ID;
  @Common.ValueList : {
    $Type: 'Common.ValueListType',
    Label: 'Genres',
    CollectionPath: 'Genres',
    Parameters: [
      {
        $Type: 'Common.ValueListParameterInOut',
        LocalDataProperty: parent_ID,
        ValueListProperty: 'ID'
      },
      {
        $Type: 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'name'
      }
    ]
  }
  parent_ID : Integer;
  @cds.ambiguous : 'missing on condition?'
  children : Composition of many CATALOG_SERVICE.Genres on children.parent_ID = ID;
  @cds.ambiguous : 'missing on condition?'
  texts : Composition of many CATALOG_SERVICE.Genres_texts;
  @cds.ambiguous : 'missing on condition?'
  localized : Association to one CATALOG_SERVICE.Genres_texts on localized.ID = ID;
};

/** Code list for currencies See https://cap.cloud.sap/docs/cds/common#entity-currencies */
@cds.external : true
@cds.persistence.skip : true
@Common.SemanticKey : [ 'code' ]
@UI.SelectionFields : [ 'name', 'descr' ]
@UI.LineItem : [
  {
    $Type: 'UI.DataField',
    Value: descr
  },
  {
    $Type: 'UI.DataField',
    Value: symbol
  },
  {
    $Type: 'UI.DataField',
    Value: code
  }
]
@UI.HeaderInfo : {
  $Type: 'UI.HeaderInfoType',
  TypeName: 'Currency',
  TypeNamePlural: '{i18n>Currencies}',
  Title: {
    $Type: 'UI.DataField',
    Value: descr
  },
  Description: {
    $Type: 'UI.DataField',
    Value: code
  }
}
@UI.Facets : [
  {
    $Type: 'UI.ReferenceFacet',
    Label: '{i18n>Details}',
    Target: @UI.![FieldGroup#Details]
  }
]
@UI.FieldGroup#Details : {
  $Type: 'UI.FieldGroupType',
  Data: [
    {
      $Type: 'UI.DataField',
      Value: name
    },
    {
      $Type: 'UI.DataField',
      Value: symbol
    },
    {
      $Type: 'UI.DataField',
      Value: code
    },
    {
      $Type: 'UI.DataField',
      Value: descr
    }
  ]
}
@UI.Identification : [
  {
    $Type: 'UI.DataField',
    Value: name
  }
]
entity CATALOG_SERVICE.Currencies {
  @Common.Label : 'Name'
  name : String(255);
  @Common.Label : 'Description'
  descr : String(1000);
  @Common.Text : name
  @Common.Label : 'Currency Code'
  key code : String(3) not null;
  @Common.Label : 'Currency'
  symbol : String(5);
  @Common.Label : 'Currency Minor Unit Fractions'
  minorUnit : Integer;
  @cds.ambiguous : 'missing on condition?'
  texts : Composition of many CATALOG_SERVICE.Currencies_texts;
  @cds.ambiguous : 'missing on condition?'
  localized : Association to one CATALOG_SERVICE.Currencies_texts on localized.code = code;
};

@cds.external : true
@cds.persistence.skip : true
@Capabilities.DeleteRestrictions.Deletable : false
@Capabilities.InsertRestrictions.Insertable : false
@Capabilities.UpdateRestrictions.Updatable : false
entity CATALOG_SERVICE.Statuses {
  @Validation.AllowedValues : [
    {
      $Type: 'Validation.AllowedValue',
      @Core.SymbolicName: 'Unscanned',
      Value: 'Unscanned'
    },
    {
      $Type: 'Validation.AllowedValue',
      @Core.SymbolicName: 'Scanning',
      Value: 'Scanning'
    },
    {
      $Type: 'Validation.AllowedValue',
      @Core.SymbolicName: 'Clean',
      Value: 'Clean'
    },
    {
      $Type: 'Validation.AllowedValue',
      @Core.SymbolicName: 'Infected',
      Value: 'Infected'
    },
    {
      $Type: 'Validation.AllowedValue',
      @Core.SymbolicName: 'Failed',
      Value: 'Failed'
    }
  ]
  key code : LargeString not null;
  text : String(255);
  @cds.ambiguous : 'missing on condition?'
  texts : Composition of many CATALOG_SERVICE.Statuses_texts;
  @cds.ambiguous : 'missing on condition?'
  localized : Association to one CATALOG_SERVICE.Statuses_texts on localized.code = code;
};

/** Aspect to capture changes by user and name See https://cap.cloud.sap/docs/cds/common#aspect-managed */
@cds.external : true
@cds.persistence.skip : true
@UI.HeaderInfo : {
  $Type: 'UI.HeaderInfoType',
  TypeName: '{i18n>Attachment}',
  TypeNamePlural: '{i18n>Attachments}'
}
@UI.LineItem : [
  {
    $Type: 'UI.DataField',
    Value: fileName,
    @HTML5.CssDefaults: {
      $Type: 'HTML5.CssDefaultsType',
      width: '20%'
    }
  },
  {
    $Type: 'UI.DataField',
    Value: content,
    @HTML5.CssDefaults: {
      $Type: 'HTML5.CssDefaultsType',
      width: '20%'
    }
  },
  {
    $Type: 'UI.DataField',
    Value: createdAt,
    @HTML5.CssDefaults: {
      $Type: 'HTML5.CssDefaultsType',
      width: '20%'
    }
  },
  {
    $Type: 'UI.DataField',
    Value: createdBy,
    @HTML5.CssDefaults: {
      $Type: 'HTML5.CssDefaultsType',
      width: '20%'
    }
  },
  {
    $Type: 'UI.DataField',
    Value: note,
    @HTML5.CssDefaults: {
      $Type: 'HTML5.CssDefaultsType',
      width: '20%'
    }
  }
]
@UI.MediaResource : {
  $Type: 'UI.MediaResourceType',
  Stream: content
}
@Common.SideEffects#ContentChanged : {
  $Type: 'Common.SideEffectsType',
  SourceProperties: [ 'content' ],
  TargetProperties: [ 'status' ]
}
entity CATALOG_SERVICE.Books_attachments {
  @cds.ambiguous : 'missing on condition?'
  up_ : Association to one CATALOG_SERVICE.Books on up_.ID = up__ID;
  key up__ID : UUID not null;
  @Core.ComputedDefaultValue : true
  key ID : UUID not null;
  @odata.Precision : 7
  @odata.Type : 'Edm.DateTimeOffset'
  @UI.HiddenFilter : true
  @UI.ExcludeFromNavigationContext : true
  @Core.Immutable : true
  @Core.Computed : true
  @Common.Label : 'Created On'
  createdAt : Timestamp;
  /** A user's unique ID */
  @UI.HiddenFilter : true
  @UI.ExcludeFromNavigationContext : true
  @Core.Immutable : true
  @Core.Computed : true
  @Common.Label : 'Created By'
  createdBy : String(255);
  @odata.Precision : 7
  @odata.Type : 'Edm.DateTimeOffset'
  @UI.HiddenFilter : true
  @UI.ExcludeFromNavigationContext : true
  @Core.Computed : true
  @Common.Label : 'Changed On'
  modifiedAt : Timestamp;
  /** A user's unique ID */
  @UI.HiddenFilter : true
  @UI.ExcludeFromNavigationContext : true
  @Core.Computed : true
  @Common.Label : 'Changed By'
  modifiedBy : String(255);
  @Core.MediaType : mimeType
  @odata.Type : 'Edm.Stream'
  @Core.ContentDisposition : {
    $Type: 'Core.ContentDispositionType',
    Filename: fileName,
    Type: 'inline'
  }
  @Common.Label : '{i18n>Attachment}'
  content : LargeBinary;
  @UI.Hidden : true
  @Core.IsMediaType : true
  @Common.Label : 'Mime Type'
  mimeType : LargeString;
  @Common.Label : '{i18n>Filename}'
  fileName : LargeString;
  @UI.Hidden : true
  @Core.Computed : true
  contentId : LargeString;
  @Common.Text : ![statusText/text]
  @Common.Text.@UI.TextArrangement : #TextOnly
  @Common.ValueList : {
    $Type: 'Common.ValueListType',
    Label: 'Status',
    CollectionPath: 'Statuses',
    Parameters: [
      {
        $Type: 'Common.ValueListParameterInOut',
        LocalDataProperty: status,
        ValueListProperty: 'code'
      },
      {
        $Type: 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'text'
      }
    ]
  }
  @Common.Label : 'Status'
  @UI.Hidden : true
  @Core.Computed : true
  @Validation.AllowedValues : [
    {
      $Type: 'Validation.AllowedValue',
      @Core.SymbolicName: 'Unscanned',
      Value: 'Unscanned'
    },
    {
      $Type: 'Validation.AllowedValue',
      @Core.SymbolicName: 'Scanning',
      Value: 'Scanning'
    },
    {
      $Type: 'Validation.AllowedValue',
      @Core.SymbolicName: 'Clean',
      Value: 'Clean'
    },
    {
      $Type: 'Validation.AllowedValue',
      @Core.SymbolicName: 'Infected',
      Value: 'Infected'
    },
    {
      $Type: 'Validation.AllowedValue',
      @Core.SymbolicName: 'Failed',
      Value: 'Failed'
    }
  ]
  status : LargeString;
  @odata.Precision : 7
  @odata.Type : 'Edm.DateTimeOffset'
  @UI.Hidden : true
  @Core.Computed : true
  scannedAt : Timestamp;
  @Common.Label : '{i18n>Note}'
  note : LargeString;
  @UI.Hidden : true
  folderId : LargeString;
  @UI.Hidden : true
  repositoryId : LargeString;
  @UI.Hidden : true
  objectId : LargeString;
  @cds.ambiguous : 'missing on condition?'
  statusText : Association to one CATALOG_SERVICE.Statuses on statusText.code = status;
};

@cds.external : true
@cds.persistence.skip : true
entity CATALOG_SERVICE.Books_texts {
  @Core.ComputedDefaultValue : true
  key ID_texts : UUID not null;
  /** Type for a language code */
  @Common.Label : 'Language Code'
  locale : String(14);
  @Common.SemanticObject : 'Books'
  @Common.Text : title
  @Common.Text.@UI.TextArrangement : #TextOnly
  @Common.Label : 'ID'
  ID : UUID;
  @Common.Label : 'Title'
  @Common.FieldControl : #Mandatory
  title : String(111);
  @UI.MultiLineText : true
  @Common.Label : 'Description'
  descr : String(1111);
};

@cds.external : true
@cds.persistence.skip : true
entity CATALOG_SERVICE.Genres_texts {
  /** Type for a language code */
  @Common.Label : 'Language Code'
  key locale : String(14) not null;
  @Common.Label : 'Genre'
  name : String(255);
  @Common.Label : 'Description'
  descr : String(1000);
  @Common.Text : name
  @Common.Text.@UI.TextArrangement : #TextOnly
  @Common.Label : 'ID'
  key ID : Integer not null;
};

@cds.external : true
@cds.persistence.skip : true
entity CATALOG_SERVICE.Currencies_texts {
  /** Type for a language code */
  @Common.Label : 'Language Code'
  key locale : String(14) not null;
  @Common.Label : 'Name'
  name : String(255);
  @Common.Label : 'Description'
  descr : String(1000);
  @Common.Text : name
  @Common.Label : 'Currency Code'
  key code : String(3) not null;
};

@cds.external : true
@cds.persistence.skip : true
entity CATALOG_SERVICE.Statuses_texts {
  /** Type for a language code */
  @Common.Label : 'Language Code'
  key locale : String(14) not null;
  @Validation.AllowedValues : [
    {
      $Type: 'Validation.AllowedValue',
      @Core.SymbolicName: 'Unscanned',
      Value: 'Unscanned'
    },
    {
      $Type: 'Validation.AllowedValue',
      @Core.SymbolicName: 'Scanning',
      Value: 'Scanning'
    },
    {
      $Type: 'Validation.AllowedValue',
      @Core.SymbolicName: 'Clean',
      Value: 'Clean'
    },
    {
      $Type: 'Validation.AllowedValue',
      @Core.SymbolicName: 'Infected',
      Value: 'Infected'
    },
    {
      $Type: 'Validation.AllowedValue',
      @Core.SymbolicName: 'Failed',
      Value: 'Failed'
    }
  ]
  key code : LargeString not null;
  text : String(255);
};

@cds.external : true
type CATALOG_SERVICE.return_CatalogService_submitOrder {
  stock : Integer;
};

@cds.external : true
service CATALOG_SERVICE {};

