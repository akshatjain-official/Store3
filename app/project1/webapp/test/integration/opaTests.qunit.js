sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'project1/test/integration/FirstJourney',
		'project1/test/integration/pages/localbooksList',
		'project1/test/integration/pages/localbooksObjectPage'
    ],
    function(JourneyRunner, opaJourney, localbooksList, localbooksObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('project1') + '/index.html'
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