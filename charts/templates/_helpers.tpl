
{{- define "go-echo99d69a9f-d225-40ee-a532-f6ed7a56223b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo99d69a9f-d225-40ee-a532-f6ed7a56223b.fullname" -}}
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


{{- define "go-echo99d69a9f-d225-40ee-a532-f6ed7a56223b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo99d69a9f-d225-40ee-a532-f6ed7a56223b.labels" -}}
helm.sh/chart: {{ include "go-echo99d69a9f-d225-40ee-a532-f6ed7a56223b.chart" . }}
{{ include "go-echo99d69a9f-d225-40ee-a532-f6ed7a56223b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo99d69a9f-d225-40ee-a532-f6ed7a56223b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo99d69a9f-d225-40ee-a532-f6ed7a56223b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}