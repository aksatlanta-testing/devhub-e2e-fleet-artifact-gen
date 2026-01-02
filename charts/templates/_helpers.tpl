
{{- define "go-echo1f8b3b0c-773a-48c5-af1e-788091a1ddda.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1f8b3b0c-773a-48c5-af1e-788091a1ddda.fullname" -}}
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


{{- define "go-echo1f8b3b0c-773a-48c5-af1e-788091a1ddda.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1f8b3b0c-773a-48c5-af1e-788091a1ddda.labels" -}}
helm.sh/chart: {{ include "go-echo1f8b3b0c-773a-48c5-af1e-788091a1ddda.chart" . }}
{{ include "go-echo1f8b3b0c-773a-48c5-af1e-788091a1ddda.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo1f8b3b0c-773a-48c5-af1e-788091a1ddda.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo1f8b3b0c-773a-48c5-af1e-788091a1ddda.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}