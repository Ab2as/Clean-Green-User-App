import 'package:clean_and_green_app/Controller/AuthController.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

const backgroundColor = Colors.black;

var buttonColor = Colors.red[400];

const borderColor = Colors.grey;

var textStyle = TextStyle(
    fontSize: 20, fontWeight: FontWeight.w200, color: Colors.red[400]);

//firebase

var firebaseAuth = FirebaseAuth.instance;

var firebsaeStorage = FirebaseStorage.instance;

var firestore = FirebaseFirestore.instance;

//controller

var authController = AuthController.instance;
