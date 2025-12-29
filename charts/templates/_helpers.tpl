
{{- define "go-echoc0dcf260-bee4-48a0-9dbc-0efdb4d3320f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc0dcf260-bee4-48a0-9dbc-0efdb4d3320f.fullname" -}}
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


{{- define "go-echoc0dcf260-bee4-48a0-9dbc-0efdb4d3320f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc0dcf260-bee4-48a0-9dbc-0efdb4d3320f.labels" -}}
helm.sh/chart: {{ include "go-echoc0dcf260-bee4-48a0-9dbc-0efdb4d3320f.chart" . }}
{{ include "go-echoc0dcf260-bee4-48a0-9dbc-0efdb4d3320f.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc0dcf260-bee4-48a0-9dbc-0efdb4d3320f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc0dcf260-bee4-48a0-9dbc-0efdb4d3320f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}