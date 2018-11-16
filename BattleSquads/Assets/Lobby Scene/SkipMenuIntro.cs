﻿using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SkipMenuIntro : MonoBehaviour {

    Animator Skipintro;

	// Use this for initialization
	void Start () {
        Skipintro = GetComponent<Animator>();
    }
	
	// Update is called once per frame
	void Update () {
        if (Input.GetKeyDown(KeyCode.Space))
        {
            Skipintro.GetComponent<Animator>().enabled = false;
            Skipintro.GetComponent<Animator>().enabled = true;
            Skipintro.Play("Empty");
        }
	}
}