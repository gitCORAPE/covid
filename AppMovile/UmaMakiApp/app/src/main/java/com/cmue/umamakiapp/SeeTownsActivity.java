package com.cmue.umamakiapp;

import android.app.AlertDialog;
import android.app.ProgressDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.os.AsyncTask;
import android.os.Bundle;
import android.text.Editable;
import android.text.TextWatcher;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.EditText;
import android.widget.Filter;
import android.widget.Filterable;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;

import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;

import com.cmue.model.Community;
import com.cmue.model.ContentCommunity;
import com.cmue.util.RestClient;
import com.cmue.util.UtilFunctions;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.ArrayList;

public class SeeTownsActivity extends AppCompatActivity {

    private LinearLayout llContainer;
    private EditText etSearch;
    private ListView lvProducts;

    private ArrayList<Community> mProductArrayList = new ArrayList<>();
    private MyAdapter adapter1;

    private Gson gson = new GsonBuilder().disableHtmlEscaping().create();

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {

        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_see_towns);
        setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_PORTRAIT);

        initialize();

        etSearch.addTextChangedListener(new TextWatcher() {

            @Override
            public void onTextChanged(CharSequence s, int start, int before, int count) {
                adapter1.getFilter().filter(s.toString());
            }

            @Override
            public void beforeTextChanged(CharSequence s, int start, int count, int after) {
            }

            @Override
            public void afterTextChanged(Editable s) {
            }
        });
    }


    @Override
    protected void onResume() {

        super.onResume();

        Community[] communities = validateCommunities();

        mProductArrayList.clear();

        for (Community aux : communities) {
            mProductArrayList.add(aux);
        }

        adapter1 = new MyAdapter(SeeTownsActivity.this, mProductArrayList);
        lvProducts.setAdapter(adapter1);

    }

    private Community[] validateCommunities() {

        try {
            BufferedReader readToken = new BufferedReader(
                    new InputStreamReader(openFileInput("jsonCommunities.txt")));
            String jCommunities = readToken.readLine();

            readToken.close();
            return gson.fromJson(jCommunities, Community[].class);
        } catch (Exception e) {
            return new Community[0];
        }

    }


    private void initialize() {
        etSearch = findViewById(R.id.etSearch);
        lvProducts = findViewById(R.id.lvProducts);
    }


    // Adapter Class
    public class MyAdapter extends BaseAdapter implements Filterable {

        private ArrayList<Community> mOriginalValues;
        private ArrayList<Community> mDisplayedValues;
        LayoutInflater inflater;

        public MyAdapter(Context context, ArrayList<Community> mProductArrayList) {
            this.mOriginalValues = mProductArrayList;
            this.mDisplayedValues = mProductArrayList;
            inflater = LayoutInflater.from(context);
        }

        @Override
        public int getCount() {
            return mDisplayedValues.size();
        }

        @Override
        public Object getItem(int position) {
            return position;
        }

        @Override
        public long getItemId(int position) {
            return position;
        }

        private class ViewHolder {
            LinearLayout llContainer;
            TextView txt_community_name, txt_community_nationality;
        }

        @Override
        public View getView(final int position, View convertView, ViewGroup parent) {

            ViewHolder holder = null;

            if (convertView == null) {

                holder = new ViewHolder();
                convertView = inflater.inflate(R.layout.item_lst_all_communities, null);
                holder.llContainer = convertView.findViewById(R.id.llContainer);
                holder.txt_community_name = convertView.findViewById(R.id.txt_community_name);
                holder.txt_community_nationality = convertView.findViewById(R.id.txt_community_nationality);
                convertView.setTag(holder);
            } else {
                holder = (ViewHolder) convertView.getTag();
            }
            holder.txt_community_name.setText(mDisplayedValues.get(position).getName());
            holder.txt_community_nationality.setText(mDisplayedValues.get(position).getNationality().getName());

            holder.llContainer.setOnClickListener(new View.OnClickListener() {

                public void onClick(View v) {

                    new AsyncTaskGetSpecificCommunity().execute(mDisplayedValues.get(position).get_id());

                    Toast.makeText(SeeTownsActivity.this, mDisplayedValues.get(position).getName(), Toast.LENGTH_SHORT).show();
                }
            });

            return convertView;
        }

        @Override
        public Filter getFilter() {
            Filter filter = new Filter() {

                @SuppressWarnings("unchecked")
                @Override
                protected void publishResults(CharSequence constraint, FilterResults results) {

                    mDisplayedValues = (ArrayList<Community>) results.values; // has the filtered values
                    notifyDataSetChanged();  // notifies the data with new filtered values
                }

                @Override
                protected FilterResults performFiltering(CharSequence constraint) {
                    FilterResults results = new FilterResults();        // Holds the results of a filtering operation in values
                    ArrayList<Community> FilteredArrList = new ArrayList<Community>();

                    if (mOriginalValues == null) {
                        mOriginalValues = new ArrayList<>(mDisplayedValues); // saves the original data in mOriginalValues
                    }

                    if (constraint == null || constraint.length() == 0) {

                        // set the Original result to return
                        results.count = mOriginalValues.size();
                        results.values = mOriginalValues;
                    } else {
                        constraint = constraint.toString().toLowerCase();
                        for (int i = 0; i < mOriginalValues.size(); i++) {
                            String data = mOriginalValues.get(i).getName();
                            if (data.toLowerCase().startsWith(constraint.toString())) {
                                Community community = new Community();
                                community.set_id(mOriginalValues.get(i).get_id());
                                community.setName(mOriginalValues.get(i).getName());
                                community.setNationality(mOriginalValues.get(i).getNationality());
                                FilteredArrList.add(community);
                            }
                        }
                        // set the Filtered result to return
                        results.count = FilteredArrList.size();
                        results.values = FilteredArrList;
                    }
                    return results;
                }
            };
            return filter;
        }
    }

    private class AsyncTaskGetSpecificCommunity extends AsyncTask<Object, Void, String> {

        private String generalResult;
        private ProgressDialog progressDialog;
        private ContentCommunity community;
        private Gson gson = new GsonBuilder().disableHtmlEscaping().create();

        @Override
        protected void onPreExecute() {
            progressDialog = ProgressDialog.show(
                    SeeTownsActivity.this, "Por favor espere", "Procesando...");
        }

        @Override
        protected String doInBackground(Object... obj) {

            String idCommunity = (String) obj[0];
            RestClient restClient = new RestClient();

            generalResult = UtilFunctions.validateOnlineNetServices();

            if (generalResult == null) {
                community = null;
                try {
                    String result = restClient.eventGet("communities/" + idCommunity);
                    community = gson.fromJson(result, ContentCommunity.class);
                } catch (Exception e) {
                    generalResult = getString(R.string.error_unexpected);
                }
            }
            return null;
        }

        @Override
        protected void onPostExecute(String result) {

            progressDialog.dismiss();

            if (generalResult == null) {
                Intent intent = new Intent(getApplicationContext(), SeeSpecificTownActivity.class);
                intent.putExtra(getString(R.string.intent_content_information), gson.toJson(community));
                startActivity(intent);
            } else {
                AlertDialog.Builder alertDialog = new AlertDialog.Builder(SeeTownsActivity.this);
                alertDialog.setTitle(getString(R.string.title_content));
                alertDialog.setCancelable(false);
                alertDialog.setMessage(generalResult);
                alertDialog.setNeutralButton(getString(R.string.btn_accept_offline_content),
                        new DialogInterface.OnClickListener() {
                            public void onClick(DialogInterface dialog, int which) {
                            }
                        });
                alertDialog.show();
            }

        }

    }


}
