sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'project1/test/integration/FirstJourney',
		'project1/test/integration/pages/NotebooksList',
		'project1/test/integration/pages/NotebooksObjectPage'
    ],
    function(JourneyRunner, opaJourney, NotebooksList, NotebooksObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('project1') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheNotebooksList: NotebooksList,
					onTheNotebooksObjectPage: NotebooksObjectPage
                }
            },
            opaJourney.run
        );
    }
);