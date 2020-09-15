package com.cmue.umamakiapp;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.AutoCompleteTextView;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import com.cmue.model.Community;
import com.cmue.model.User;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class SingInActivity extends AppCompatActivity {

    //Declaration principal variables
    String jsonUser = "";
    Community selected_community = null;
    Community[] list_communities;
    Map<String, Community> map_communities;
    User user;
    String IMEI = "";
    Gson gson = new GsonBuilder().disableHtmlEscaping().create();

    //Principal widgets
    EditText txt_name_singin;
    TextView txt_nationality_singin;
    AutoCompleteTextView txt_community_singin;
    TextView btn_singin;

    @Override
    protected void onCreate(Bundle savedInstanceState) {

        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_sing_in);
        setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_PORTRAIT);

        //Get email info from others activities and validate communities info
        try {
            Intent intent = getIntent();
            jsonUser = intent.getExtras().getString(getString(R.string.intent_user_information));
            IMEI = intent.getExtras().getString(getString(R.string.intent_IMEI));
            user = gson.fromJson(jsonUser, User.class);
            if (!validateCommunities()) {
                throw new Exception();
            }
        } catch (Exception e) {
            //If email or communities info are wrong, return to email activity
            list_communities = new Community[]{};
            Toast.makeText(getApplicationContext(), R.string.error_unexpected, Toast.LENGTH_LONG).show();
            Intent return_emailactivity = new Intent(getApplicationContext(), EmailActivity.class);
            startActivity(return_emailactivity);
            finish();
        }

        //Declaration widget editText user name
        txt_name_singin = (EditText) findViewById(R.id.txt_name_singin);

        //Set the  list of names' communities
        String[] community_items_autoCTV = fillCommunityItems();

        //Declaration widget editText community and textView nationality
        txt_nationality_singin = (TextView) findViewById(R.id.txt_nationality_singin);

        txt_community_singin = (AutoCompleteTextView) findViewById(R.id.txt_community_singin);
        ArrayAdapter<String> adapter = new ArrayAdapter<String>(this,
                R.layout.dropdown_item,
                R.id.text_view_list_item,
                community_items_autoCTV);
        txt_community_singin.setAdapter(adapter);

        //Listener when an item is selected
        txt_community_singin.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> adapterView, View view, int i, long l) {
                selectCommunity(txt_community_singin.getText().toString());
            }
        });

        txt_community_singin.setOnFocusChangeListener(new View.OnFocusChangeListener() {
            @Override
            public void onFocusChange(View view, boolean b) {
                if(b){
                    //txt_community_singin.showDropDown();
                }
                else{
                    if(!map_communities.containsKey(txt_community_singin.getText().toString().trim().toUpperCase())){
                        txt_community_singin.setText("");
                        txt_nationality_singin.setText("");
                        selected_community = null;
                        Toast.makeText(getApplicationContext(),
                                getText(R.string.message_error_community),
                                Toast.LENGTH_LONG).show();
                    }
                    else{
                        selectCommunity(txt_community_singin.getText().toString());
                    }
                }
            }
        });




        //Declaration button to sing in user
        btn_singin = (TextView) findViewById(R.id.btn_singin);
        btn_singin.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                String user_name = txt_name_singin.getText().toString().trim();
                txt_community_singin.clearFocus();

                if (!user_name.equals("") && selected_community != null) {
                    //Go to singin
                    user.setName(user_name);
                    user.setNationality(selected_community.getNationality().getName());
                    user.setCommunity(selected_community.getName());
                    Intent go_singinProcess = new Intent(getApplicationContext(), AwaitActivityLog.class);
                    go_singinProcess.putExtra(getString(R.string.intent_user_information), gson.toJson(user));
                    go_singinProcess.putExtra(getString(R.string.intent_type_process_login), 2);
                    go_singinProcess.putExtra(getString(R.string.intent_IMEI), IMEI);
                    startActivity(go_singinProcess);
                    finish();
                } else {
                    Toast.makeText(getApplicationContext(),
                            R.string.message_error_information_signin,
                            Toast.LENGTH_SHORT).show();
                }


            }
        });


    }


    /*
     * Read the information of communities from internal memory
     * */
    public boolean validateCommunities() {
        boolean flag;
        try {
            BufferedReader readToken = new BufferedReader(
                    new InputStreamReader(openFileInput("jsonCommunities.txt")));
            String jCommunities = readToken.readLine();
            //Toast.makeText(getApplicationContext(), jCommunities, Toast.LENGTH_LONG).show();
            readToken.close();
            list_communities = gson.fromJson(jCommunities, Community[].class);
            flag = true;
        } catch (Exception e) {
            flag = false;
        }
        return flag;
    }


    /*
     * Fill dictionary and items with community information
     * */
    public String[] fillCommunityItems() {
        List<String> list = new ArrayList<>();
        map_communities = new HashMap<String, Community>();
        for (Community aux : list_communities) {
            String key = aux.getName().toUpperCase();
            if(!map_communities.containsKey(key)){
                map_communities.put(key, aux);
                list.add(aux.getName());
            }
        }
        String[] response = new String[list.size()];
        for(int i = 0; i< response.length; i++){
            response[i] = list.get(i).toString();
        }
        return response;
    }

    /*
     * Set the information of nationality and community selected
     * */
    public void selectCommunity(String textSelected) {
        Community community = map_communities.get(textSelected.trim().toUpperCase());
        if(community != null){
            selected_community = community;
            txt_nationality_singin.setText(community.getNationality().getName());
        }
        else{
            selected_community = null;
        }
    }
}
