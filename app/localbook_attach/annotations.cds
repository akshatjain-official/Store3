using storeservice as service from '../../srv/storeservice';
annotate service.localbooks with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'createdAt',
                Value : createdAt,
            },
            {
                $Type : 'UI.DataField',
                Label : 'modifiedAt',
                Value : modifiedAt,
            },
            {
                $Type : 'UI.DataField',
                Label : 'title',
                Value : title,
            },
            {
                $Type : 'UI.DataField',
                Label : 'descr',
                Value : descr,
            },
            {
                $Type : 'UI.DataField',
                Label : 'author',
                Value : author,
            },
            {
                $Type : 'UI.DataField',
                Label : 'genre_ID',
                Value : genre_ID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'stock',
                Value : stock,
            },
            {
                $Type : 'UI.DataField',
                Label : 'price',
                Value : price,
            },
            {
                $Type : 'UI.DataField',
                Label : 'currency_code',
                Value : currency_code,
            },
            {
                $Type : 'UI.DataField',
                Label : 'image',
                Value : image,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID     : 'AttachmentsFacet',
            Label : '{i18n>attachments}',
            Target: 'attachments/@UI.LineItem'
        }
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'createdAt',
            Value : createdAt,
        },
        {
            $Type : 'UI.DataField',
            Label : 'modifiedAt',
            Value : modifiedAt,
        },
        {
            $Type : 'UI.DataField',
            Label : 'title',
            Value : title,
        },
        {
            $Type : 'UI.DataField',
            Label : 'descr',
            Value : descr,
        },
        {
            $Type : 'UI.DataField',
            Label : 'author',
            Value : author,
        },
    ],
);

annotate service.localbooks with {
    genre @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Genres',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : genre_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'name',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'descr',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'parent_ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'children_ID',
            },
        ],
    }
};

annotate service.localbooks with {
    attachments @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'localattachment',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : attachments_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'createdAt',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'createdBy',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'modifiedAt',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'modifiedBy',
            },
        ],
    }
};

annotate service.localbooks with {
    texts @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Books_texts',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : texts_ID_texts,
                ValueListProperty : 'ID_texts',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'locale',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'title',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'descr',
            },
        ],
    }
};

