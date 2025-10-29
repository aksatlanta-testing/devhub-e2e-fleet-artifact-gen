
{{- define "go-echocf46a22c-be80-4a21-9b61-76b753e9e86f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocf46a22c-be80-4a21-9b61-76b753e9e86f.fullname" -}}
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


{{- define "go-echocf46a22c-be80-4a21-9b61-76b753e9e86f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocf46a22c-be80-4a21-9b61-76b753e9e86f.labels" -}}
helm.sh/chart: {{ include "go-echocf46a22c-be80-4a21-9b61-76b753e9e86f.chart" . }}
{{ include "go-echocf46a22c-be80-4a21-9b61-76b753e9e86f.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echocf46a22c-be80-4a21-9b61-76b753e9e86f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echocf46a22c-be80-4a21-9b61-76b753e9e86f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}