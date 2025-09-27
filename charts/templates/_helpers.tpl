
{{- define "go-echoe88d80d1-7035-4540-9b81-db7e773c24da.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe88d80d1-7035-4540-9b81-db7e773c24da.fullname" -}}
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


{{- define "go-echoe88d80d1-7035-4540-9b81-db7e773c24da.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe88d80d1-7035-4540-9b81-db7e773c24da.labels" -}}
helm.sh/chart: {{ include "go-echoe88d80d1-7035-4540-9b81-db7e773c24da.chart" . }}
{{ include "go-echoe88d80d1-7035-4540-9b81-db7e773c24da.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe88d80d1-7035-4540-9b81-db7e773c24da.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe88d80d1-7035-4540-9b81-db7e773c24da.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}