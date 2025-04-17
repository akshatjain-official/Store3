sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'localbookattach/test/integration/FirstJourney',
		'localbookattach/test/integration/pages/localbooksList',
		'localbookattach/test/integration/pages/localbooksObjectPage'
    ],
    function(JourneyRunner, opaJourney, localbooksList, localbooksObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('localbookattach') + '/index.html'
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