sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'notebookwriter/test/integration/FirstJourney',
		'notebookwriter/test/integration/pages/NotebooksList',
		'notebookwriter/test/integration/pages/NotebooksObjectPage'
    ],
    function(JourneyRunner, opaJourney, NotebooksList, NotebooksObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('notebookwriter') + '/index.html'
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