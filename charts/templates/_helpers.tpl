
{{- define "go-echoe5898f87-ca81-41af-9b96-c8ec4d71b743.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe5898f87-ca81-41af-9b96-c8ec4d71b743.fullname" -}}
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


{{- define "go-echoe5898f87-ca81-41af-9b96-c8ec4d71b743.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe5898f87-ca81-41af-9b96-c8ec4d71b743.labels" -}}
helm.sh/chart: {{ include "go-echoe5898f87-ca81-41af-9b96-c8ec4d71b743.chart" . }}
{{ include "go-echoe5898f87-ca81-41af-9b96-c8ec4d71b743.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe5898f87-ca81-41af-9b96-c8ec4d71b743.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe5898f87-ca81-41af-9b96-c8ec4d71b743.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}