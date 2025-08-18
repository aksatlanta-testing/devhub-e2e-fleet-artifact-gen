
{{- define "go-echod910c39e-cb33-48dc-a9a4-b90bb9599965.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod910c39e-cb33-48dc-a9a4-b90bb9599965.fullname" -}}
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


{{- define "go-echod910c39e-cb33-48dc-a9a4-b90bb9599965.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod910c39e-cb33-48dc-a9a4-b90bb9599965.labels" -}}
helm.sh/chart: {{ include "go-echod910c39e-cb33-48dc-a9a4-b90bb9599965.chart" . }}
{{ include "go-echod910c39e-cb33-48dc-a9a4-b90bb9599965.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod910c39e-cb33-48dc-a9a4-b90bb9599965.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod910c39e-cb33-48dc-a9a4-b90bb9599965.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}