{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "thanos.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "thanos.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "thanos.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "thanos.store.tlsServer.secretName" -}}
{{- if (and .Values.store.tlsServer.secretName (ne .Values.store.tlsServer.secretName ""))  -}}
.Values.store.tlsServer.secretName 
{{- else -}}
{{- include "thanos.fullname" . -}}-thanos-store-tls-server
{{- end -}}
{{- end -}}

{{- define "thanos.query.tlsClient.secretName" -}}
{{- if (and .Values.query.tlsClient.secretName (ne .Values.query.tlsClient.secretName ""))  -}}
.Values.query.tlsClient.secretName 
{{- else -}}
{{- include "thanos.fullname" . -}}-thanos-query-tls-client
{{- end -}}
{{- end -}}

{{- define "thanos.query.tlsServer.secretName" -}}
{{- if (and .Values.query.tlsServer.secretName (ne .Values.query.tlsServer.secretName ""))  -}}
.Values.query.tlsServer.secretName 
{{- else -}}
{{- include "thanos.fullname" . -}}-thanos-query-tls-server
{{- end -}}
{{- end -}}
