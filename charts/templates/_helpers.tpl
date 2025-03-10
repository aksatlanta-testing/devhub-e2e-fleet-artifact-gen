
{{- define "go-echoa0e865ab-b872-448b-92ab-732ea3895bce.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa0e865ab-b872-448b-92ab-732ea3895bce.fullname" -}}
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


{{- define "go-echoa0e865ab-b872-448b-92ab-732ea3895bce.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa0e865ab-b872-448b-92ab-732ea3895bce.labels" -}}
helm.sh/chart: {{ include "go-echoa0e865ab-b872-448b-92ab-732ea3895bce.chart" . }}
{{ include "go-echoa0e865ab-b872-448b-92ab-732ea3895bce.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa0e865ab-b872-448b-92ab-732ea3895bce.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa0e865ab-b872-448b-92ab-732ea3895bce.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}