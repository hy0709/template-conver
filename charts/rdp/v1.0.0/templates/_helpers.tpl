{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "rdp.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}


{{/*
Create chart name and port as used by the chart label.
*/}}
{{- define "rdp.chart" -}}
{{- printf "%s-%s"  .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "rdp.labels" -}}
app: {{ include "rdp.name" . }}
chart: {{ include "rdp.chart" . }}
release: {{ .Release.Name }}
heritage: {{ .Release.Service }}
{{- end -}}


{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "rdp.fullname" -}}
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
{{- define "jdbc.host" -}}
{{- printf "%s.%s.%s" .Values.env.jdbc.host .Release.Namespace "svc.cluster.local" | replace "+" "." | trunc 63 | trimSuffix "." -}}
{{- end -}}
