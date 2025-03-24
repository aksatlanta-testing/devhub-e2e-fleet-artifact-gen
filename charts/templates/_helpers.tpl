
{{- define "go-echo429c418a-c55e-4463-8999-27df9e926627.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo429c418a-c55e-4463-8999-27df9e926627.fullname" -}}
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


{{- define "go-echo429c418a-c55e-4463-8999-27df9e926627.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo429c418a-c55e-4463-8999-27df9e926627.labels" -}}
helm.sh/chart: {{ include "go-echo429c418a-c55e-4463-8999-27df9e926627.chart" . }}
{{ include "go-echo429c418a-c55e-4463-8999-27df9e926627.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo429c418a-c55e-4463-8999-27df9e926627.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo429c418a-c55e-4463-8999-27df9e926627.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}