
import 'dart:convert';


import 'package:news_app/models/api_response.dart';
import 'package:news_app/models/note.dart';
import 'package:news_app/models/note_for_listing.dart';
import 'package:http/http.dart' as https;
import 'package:news_app/models/note_insert.dart';

class NoteServices{

static const API = "https://tq-notes-api-jkrgrdggbq-el.a.run.app";
static const headers = {
"apiKey": "ae1d5895-1418-4231-af1b-c55433f47c8b",
"content-Type" : "application/json"
};


  Future<APIResponse<List<NoteForListing>>> getNoteList(){

    return https.get(API + '/notes', headers: headers).then((data){
      if(data.statusCode == 200){
        final jsonData = json.decode(data.body);
        final notes = <NoteForListing>[];
        for(var item in jsonData){
         
          notes.add(NoteForListing.fromJson(item));
        }

        return APIResponse<List<NoteForListing>>(data: notes);    

      }

     return APIResponse<List<NoteForListing>>(error: true, errorMessage: 'An error occured');  
    })
    .catchError((_) => APIResponse<List<NoteForListing>>(error: true, errorMessage: 'An error occured'));
  }

  Future<APIResponse<Note>> getNote(String noteID){

    return https.get(API + '/notes/' + noteID, headers: headers).then((data){
      if(data.statusCode == 200){
        final jsonData = json.decode(data.body);
    

        return APIResponse<Note>(data: Note.fromJson(jsonData));    

      }

     return APIResponse<Note>(error: true, errorMessage: 'An error occured');  
    })
    .catchError((_) => APIResponse<Note>(error: true, errorMessage: 'An error occured'));
  }

  Future<APIResponse<bool>> createNote(NoteManipulation item){

    return https.post(API + '/notes', headers: headers, body: json.encode(item.toJson())).then((data){
      if(data.statusCode == 201){

        return APIResponse<bool>(data: true);    
      }

     return APIResponse<bool>(error: true, errorMessage: 'An error occured');  
    })
    .catchError((_) => APIResponse<bool>(error: true, errorMessage: 'An error occured'));
  }

  Future<APIResponse<bool>> updateNote(String noteID, NoteManipulation item){

    return https.put(API + '/notes/' + noteID, headers: headers, body: json.encode(item.toJson())).then((data){
      if(data.statusCode == 204){

        return APIResponse<bool>(data: true);    
      }

     return APIResponse<bool>(error: true, errorMessage: 'An error occured');  
    })
    .catchError((_) => APIResponse<bool>(error: true, errorMessage: 'An error occured'));
  }

  Future<APIResponse<bool>> deleteNote(String noteID){

    return https.delete(API + '/notes/' + noteID, headers: headers).then((data){
      if(data.statusCode == 204){

        return APIResponse<bool>(data: true);    
      }

     return APIResponse<bool>(error: true, errorMessage: 'An error occured');  
    })
    .catchError((_) => APIResponse<bool>(error: true, errorMessage: 'An error occured'));
  }

  
}