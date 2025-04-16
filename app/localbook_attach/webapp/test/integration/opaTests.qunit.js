sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'localbook/test/integration/FirstJourney',
		'localbook/test/integration/pages/localbooksList',
		'localbook/test/integration/pages/localbooksObjectPage'
    ],
    function(JourneyRunner, opaJourney, localbooksList, localbooksObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('localbook') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onThelocalbooksList: localbooksList,
					onThelocalbooksObjectPage: localbooksObjectPage
                }
            },
            opaJourney.run
        );
    }
);