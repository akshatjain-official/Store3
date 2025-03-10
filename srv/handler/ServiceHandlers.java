import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

import com.sap.cds.Result;
import com.sap.cds.services.cds.CdsReadEventContext;
import com.sap.cds.services.cds.RemoteService;
import com.sap.cds.services.handler.EventHandler;
import com.sap.cds.services.handler.annotations.On;
import com.sap.cds.services.handler.annotations.ServiceName;

import cds.gen.catalog_service.CatalogService_;
import cds.gen.storeservice.LocalAttachment_;
import cds.gen.storeservice.StoreService_;
import cds.gen.storeservice.Writers_;

@Component
@ServiceName(StoreService_.CDS_NAME)
public class ServiceHandlers implements EventHandler{
    
    @Autowired
    @Qualifier(CatalogService_.CDS_NAME)
    RemoteService remoteService;
    @On(entity = CatalogService_.BOOKS)
    Result readSuppliers(CdsReadEventContext context){
        return remoteService.run(context.getCqn());
    }
}
