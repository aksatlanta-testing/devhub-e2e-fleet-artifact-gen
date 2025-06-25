
{{- define "go-echoe937db63-bc12-4c3c-994d-464373d18aee.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe937db63-bc12-4c3c-994d-464373d18aee.fullname" -}}
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


{{- define "go-echoe937db63-bc12-4c3c-994d-464373d18aee.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe937db63-bc12-4c3c-994d-464373d18aee.labels" -}}
helm.sh/chart: {{ include "go-echoe937db63-bc12-4c3c-994d-464373d18aee.chart" . }}
{{ include "go-echoe937db63-bc12-4c3c-994d-464373d18aee.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe937db63-bc12-4c3c-994d-464373d18aee.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe937db63-bc12-4c3c-994d-464373d18aee.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}