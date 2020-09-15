package com.cmue.util;

import com.cmue.umamakiapp.App;
import com.cmue.umamakiapp.R;

public class UtilFunctions {

    private static Boolean isOnlineNet() {

        try {
            Process p = java.lang.Runtime.getRuntime().exec("ping -c 1 www.google.es");
            int val = p.waitFor();
            return val == 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;

    }

    public static String validateOnlineNetServices() {

        RestClient restClient = new RestClient();

        try{
            if (!restClient.isOnlineNet()) {
                return App.getContext().getResources().getString(R.string.error_access_internet);
            } else if (!restClient.isOnlineServices()){
                return App.getContext().getResources().getString(R.string.error_access_services);
            }
        } catch (Exception e){
            e.printStackTrace();
            return App.getContext().getResources().getString(R.string.error_access_services);
        }

        return null;

    }

}
