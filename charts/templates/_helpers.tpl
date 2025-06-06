
{{- define "go-echo7be96c39-88d2-4304-b129-2e228dad8099.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7be96c39-88d2-4304-b129-2e228dad8099.fullname" -}}
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


{{- define "go-echo7be96c39-88d2-4304-b129-2e228dad8099.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7be96c39-88d2-4304-b129-2e228dad8099.labels" -}}
helm.sh/chart: {{ include "go-echo7be96c39-88d2-4304-b129-2e228dad8099.chart" . }}
{{ include "go-echo7be96c39-88d2-4304-b129-2e228dad8099.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo7be96c39-88d2-4304-b129-2e228dad8099.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo7be96c39-88d2-4304-b129-2e228dad8099.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}