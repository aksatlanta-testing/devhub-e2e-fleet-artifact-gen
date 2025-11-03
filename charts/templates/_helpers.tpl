
{{- define "go-echocf21a955-dbc4-4582-87e9-7b177b646923.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocf21a955-dbc4-4582-87e9-7b177b646923.fullname" -}}
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


{{- define "go-echocf21a955-dbc4-4582-87e9-7b177b646923.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocf21a955-dbc4-4582-87e9-7b177b646923.labels" -}}
helm.sh/chart: {{ include "go-echocf21a955-dbc4-4582-87e9-7b177b646923.chart" . }}
{{ include "go-echocf21a955-dbc4-4582-87e9-7b177b646923.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echocf21a955-dbc4-4582-87e9-7b177b646923.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echocf21a955-dbc4-4582-87e9-7b177b646923.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}