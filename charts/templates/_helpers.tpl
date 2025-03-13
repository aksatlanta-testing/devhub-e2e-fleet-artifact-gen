
{{- define "go-echoab576248-bc0b-4e1d-be5c-e164d39ca513.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoab576248-bc0b-4e1d-be5c-e164d39ca513.fullname" -}}
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


{{- define "go-echoab576248-bc0b-4e1d-be5c-e164d39ca513.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoab576248-bc0b-4e1d-be5c-e164d39ca513.labels" -}}
helm.sh/chart: {{ include "go-echoab576248-bc0b-4e1d-be5c-e164d39ca513.chart" . }}
{{ include "go-echoab576248-bc0b-4e1d-be5c-e164d39ca513.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoab576248-bc0b-4e1d-be5c-e164d39ca513.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoab576248-bc0b-4e1d-be5c-e164d39ca513.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}