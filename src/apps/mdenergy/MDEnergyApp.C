#include "wx/wxprec.h"


#ifndef WX_PRECOMP
#include "wx/wx.h"
#endif

#include <iostream>
  using std::cout;
  using std::endl;
  using std::ends;
#include <strstream>
  using std::ostrstream;


#include "MDEnergy.H"
#include "MDEnergyApp.H"

IMPLEMENT_APP(MDEnergyApp)


/**
 * Constructor.
 */
MDEnergyApp::MDEnergyApp()
{
   p_frame = 0;
}


/**
 * Destructor.
 */
MDEnergyApp::~MDEnergyApp()
{
}

string MDEnergyApp::getName() const
{
   return MDENERGY;
}


bool MDEnergyApp::OnInit()
{
   ewxApp::OnInit();

   if (argc>2 && strcmp(argv[1],"-pipe")==0) {
     AuthCache::getCache().pipeIn(argv[2]);
   }

   p_frame = new MDEnergy((wxFrame*)NULL);
   p_frame->Show(TRUE);
   SetTopWindow(p_frame);

   processGlobalPreferenceChange();

   return true;
}

