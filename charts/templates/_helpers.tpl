
{{- define "go-echocff95816-7b91-41c4-8490-86044d8d888e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocff95816-7b91-41c4-8490-86044d8d888e.fullname" -}}
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


{{- define "go-echocff95816-7b91-41c4-8490-86044d8d888e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocff95816-7b91-41c4-8490-86044d8d888e.labels" -}}
helm.sh/chart: {{ include "go-echocff95816-7b91-41c4-8490-86044d8d888e.chart" . }}
{{ include "go-echocff95816-7b91-41c4-8490-86044d8d888e.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echocff95816-7b91-41c4-8490-86044d8d888e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echocff95816-7b91-41c4-8490-86044d8d888e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}