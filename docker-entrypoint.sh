#!/bin/bash

omd create ${OMD_ENV} || true
su -c "omd config set TMPFS off" ${OMD_ENV}
su -c "omd start" ${OMD_ENV}