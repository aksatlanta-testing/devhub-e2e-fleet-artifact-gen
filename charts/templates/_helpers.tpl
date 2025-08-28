
{{- define "go-echoea7dc3ae-70a4-4e19-9632-3061ac312cf9.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoea7dc3ae-70a4-4e19-9632-3061ac312cf9.fullname" -}}
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


{{- define "go-echoea7dc3ae-70a4-4e19-9632-3061ac312cf9.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoea7dc3ae-70a4-4e19-9632-3061ac312cf9.labels" -}}
helm.sh/chart: {{ include "go-echoea7dc3ae-70a4-4e19-9632-3061ac312cf9.chart" . }}
{{ include "go-echoea7dc3ae-70a4-4e19-9632-3061ac312cf9.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoea7dc3ae-70a4-4e19-9632-3061ac312cf9.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoea7dc3ae-70a4-4e19-9632-3061ac312cf9.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}