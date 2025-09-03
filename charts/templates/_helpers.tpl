
{{- define "go-echo0e44bfd9-05ec-4d7d-931b-1aedc3208662.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0e44bfd9-05ec-4d7d-931b-1aedc3208662.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}


{{- define "go-echo0e44bfd9-05ec-4d7d-931b-1aedc3208662.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0e44bfd9-05ec-4d7d-931b-1aedc3208662.labels" -}}
helm.sh/chart: {{ include "go-echo0e44bfd9-05ec-4d7d-931b-1aedc3208662.chart" . }}
{{ include "go-echo0e44bfd9-05ec-4d7d-931b-1aedc3208662.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo0e44bfd9-05ec-4d7d-931b-1aedc3208662.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo0e44bfd9-05ec-4d7d-931b-1aedc3208662.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}