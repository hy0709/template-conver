{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "rtdb.vzdb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}


{{/*
Create chart name and port as used by the chart label.
*/}}
{{- define "rtdb.vzdb.chart" -}}
{{- printf "%s-%s"  .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "rtdb.vzdb.labels" -}}
app: {{ include "rtdb.vzdb.name" . }}
chart: {{ include "rtdb.vzdb.chart" . }}
release: {{ .Release.Name }}
heritage: {{ .Release.Service }}
{{- end -}}


{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "rtdb.vzdb.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{{/*
Create consul host as used by the chart label.
*/}}
{{- define "reg.host" -}}
{{- printf "%s.%s.%s" .Values.env.reg.host .Release.Namespace "svc.cluster.local" | replace "+" "." | trunc 63 | trimSuffix "." -}}
{{- end -}}

{{/*
Create rtdb host as used by the chart label.
*/}}
{{- define "rtdb.host" -}}
{{- printf "%s.%s.%s" .Values.env.rtdb.host .Release.Namespace "svc.cluster.local" | replace "+" "." | trunc 63 | trimSuffix "." -}}
{{- end -}}
