"""
Created on Fri Apr 24 21:39:15 2020

@author: kuljeet
"""
from flask import request, redirect,Flask,jsonify,render_template
import os
import cv2
from flask import Flask, jsonify, request
from dir import*
from lib import* #library file
# from line_removal import*  #morphological operation file
from tessarct import*  #tessaract processing file


app = Flask(__name__)
app.config["UPLOAD_FOLDER"] = "C:\\Users\\jagno\\Desktop\\meaning_detection"
@app.route("/", methods=["GET","POST"])
def upload_image():
    if request.method =="POST":
      #  print("line 21")
        dir()  #to make directory
       # print("line 23")
        file= request.files["file"]
        print(file)
        #print("line 25")
        file.save(os.path.join('C:\\Users\\jagno\\Desktop\\meaning_detection\\image',file.filename))
        #print("line 26")
        line()  #calling line_removal file
        return jsonify("Image uploaded succesfully",tess())   #tessarct.py file
        #else:
    #  return jsonify("OOPS!! image not uploaded")
    return('<h1>Smart Ocr Dictionary</h1>')
    #return render_template('upload.html')
#app.run(debug=True)
app.run(host='0.0.0.0')        