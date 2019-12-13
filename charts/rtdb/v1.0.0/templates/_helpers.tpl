{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "kdm.rdp.rtdb.vzdb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}


{{/*
Create chart name and port as used by the chart label.
*/}}
{{- define "vzdb.chart" -}}
{{- printf "%s-%s" .Values.kdm.rdp.rtdb.vzdb.containerName .Values.externalPort | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}


{{/*
Create consul host as used by the chart label.
*/}}
{{- define "env.reg.host" -}}
{{- printf "%s.%s" .Values.env.reg.host "svc.cluster.local" | replace "+" "." | trunc 63 | trimSuffix "." -}}
{{- end -}}


{{/*
Create rtdb host as used by the chart label.
*/}}
{{- define "env.rtdb.host" -}}
{{- printf "%s.%s" .Values.env.rtdb.host "svc.cluster.local" | replace "+" "." | trunc 63 | trimSuffix "." -}}
{{- end -}}
