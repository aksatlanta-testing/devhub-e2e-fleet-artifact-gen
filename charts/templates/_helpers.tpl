
{{- define "go-echo68d5b7b9-2892-4e7e-b410-c0e0634cdfae.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo68d5b7b9-2892-4e7e-b410-c0e0634cdfae.fullname" -}}
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


{{- define "go-echo68d5b7b9-2892-4e7e-b410-c0e0634cdfae.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo68d5b7b9-2892-4e7e-b410-c0e0634cdfae.labels" -}}
helm.sh/chart: {{ include "go-echo68d5b7b9-2892-4e7e-b410-c0e0634cdfae.chart" . }}
{{ include "go-echo68d5b7b9-2892-4e7e-b410-c0e0634cdfae.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo68d5b7b9-2892-4e7e-b410-c0e0634cdfae.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo68d5b7b9-2892-4e7e-b410-c0e0634cdfae.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}