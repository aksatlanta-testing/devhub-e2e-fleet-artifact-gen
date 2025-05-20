
{{- define "go-echocdbf5f3c-80db-48d9-b4ec-221c3e42aebd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocdbf5f3c-80db-48d9-b4ec-221c3e42aebd.fullname" -}}
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


{{- define "go-echocdbf5f3c-80db-48d9-b4ec-221c3e42aebd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocdbf5f3c-80db-48d9-b4ec-221c3e42aebd.labels" -}}
helm.sh/chart: {{ include "go-echocdbf5f3c-80db-48d9-b4ec-221c3e42aebd.chart" . }}
{{ include "go-echocdbf5f3c-80db-48d9-b4ec-221c3e42aebd.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echocdbf5f3c-80db-48d9-b4ec-221c3e42aebd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echocdbf5f3c-80db-48d9-b4ec-221c3e42aebd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}