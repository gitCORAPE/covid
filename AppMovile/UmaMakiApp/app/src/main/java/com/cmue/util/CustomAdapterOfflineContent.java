package com.cmue.util;

import android.app.Activity;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.TextView;
import android.widget.Toast;

import com.cmue.model.Content;
import com.cmue.umamakiapp.EditContentActivity;
import com.cmue.umamakiapp.OfflineContentActivity;
import com.cmue.umamakiapp.R;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import java.io.OutputStreamWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class CustomAdapterOfflineContent extends BaseAdapter {

    private Activity context;
    private Content[] contentList;
    private LayoutInflater inflater;
    private Gson gson = new GsonBuilder().disableHtmlEscaping().create();

    public CustomAdapterOfflineContent(Activity applicationContext, Content[] contents) {

        this.context = applicationContext;
        this.contentList = contents;
        this.inflater = (LayoutInflater.from(applicationContext));

    }

    @Override
    public int getCount() {
        return contentList.length;
    }

    @Override
    public Object getItem(int position) {
        return contentList[position];
    }

    @Override
    public long getItemId(int position) {
        return position;
    }

    @Override
    public View getView(final int position, View convertView, ViewGroup parent) {

        convertView = inflater.inflate(R.layout.item_listview_content, null);

        TextView txt_offline_theme = convertView.findViewById(R.id.txt_offline_theme);
        TextView txt_offline_community = convertView.findViewById(R.id.txt_offline_community);
        TextView txt_offline_date = convertView.findViewById(R.id.txt_offline_date);
        TextView btn_delete_offline_content = convertView.findViewById(R.id.btn_delete_offline_content);
        TextView btn_edit_offline_content = convertView.findViewById(R.id.btn_edit_offline_content);

        txt_offline_theme.setText(contentList[position].getTopic());
        txt_offline_community.setText(contentList[position].getCommunityObject().getName());
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        String dateString = format.format(contentList[position].getDate());
        txt_offline_date.setText(dateString);

        btn_delete_offline_content.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                android.app.AlertDialog.Builder alertDialog;
                alertDialog = new android.app.AlertDialog.Builder(context);
                alertDialog.setTitle(context.getString(R.string.title_delete_content));
                alertDialog.setMessage(context.getString(R.string.confirm_delete_content));
                alertDialog.setNeutralButton(context.getString(R.string.accept_confirmation),
                        new DialogInterface.OnClickListener() {
                            public void onClick(DialogInterface dialog, int which) {
                                deleteContent(position);
                            }
                        });
                alertDialog.setPositiveButton(context.getString(R.string.cancel_confirmation),
                        new DialogInterface.OnClickListener() {
                            public void onClick(DialogInterface dialog, int which) {

                            }
                        });

                alertDialog.show();
            }
        });

        btn_edit_offline_content.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(context, EditContentActivity.class);
                intent.putExtra("position", position);
                context.startActivity(intent);
            }
        });

        return convertView;

    }

    private void deleteContent(int position) {

        List<Content> new_content_list = new ArrayList<>();
        for (int i = 0; i < contentList.length; i++) {
            if (i != position) {
                new_content_list.add(contentList[i]);
            }
        }
        if (saveData(gson.toJson(new_content_list))) {
            Toast.makeText(context.getApplicationContext(),
                    context.getString(R.string.delete_successful),
                    Toast.LENGTH_SHORT).show();

            Intent intent = new Intent(context.getApplicationContext(), OfflineContentActivity.class);
            context.startActivity(intent);
            context.finish();
        } else {
            Toast.makeText(context.getApplicationContext(),
                    context.getString(R.string.delete_error),
                    Toast.LENGTH_SHORT).show();
        }

    }

    private boolean saveData(String jsonData) {

        try {
            OutputStreamWriter fileUser =
                    new OutputStreamWriter(
                            context.openFileOutput("jsonOffline.txt", Context.MODE_PRIVATE));
            fileUser.write(jsonData);
            fileUser.close();
            return true;
        } catch (Exception e) {
            return false;
        }

    }

}
