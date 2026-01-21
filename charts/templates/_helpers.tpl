
{{- define "go-echo291315dd-6dcc-4cc4-b23d-37d2a1cc4cdb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo291315dd-6dcc-4cc4-b23d-37d2a1cc4cdb.fullname" -}}
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


{{- define "go-echo291315dd-6dcc-4cc4-b23d-37d2a1cc4cdb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo291315dd-6dcc-4cc4-b23d-37d2a1cc4cdb.labels" -}}
helm.sh/chart: {{ include "go-echo291315dd-6dcc-4cc4-b23d-37d2a1cc4cdb.chart" . }}
{{ include "go-echo291315dd-6dcc-4cc4-b23d-37d2a1cc4cdb.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo291315dd-6dcc-4cc4-b23d-37d2a1cc4cdb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo291315dd-6dcc-4cc4-b23d-37d2a1cc4cdb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}