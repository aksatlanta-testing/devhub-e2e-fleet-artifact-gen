
{{- define "go-echoed2e7dca-173b-4828-beab-cad63c37956e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoed2e7dca-173b-4828-beab-cad63c37956e.fullname" -}}
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


{{- define "go-echoed2e7dca-173b-4828-beab-cad63c37956e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoed2e7dca-173b-4828-beab-cad63c37956e.labels" -}}
helm.sh/chart: {{ include "go-echoed2e7dca-173b-4828-beab-cad63c37956e.chart" . }}
{{ include "go-echoed2e7dca-173b-4828-beab-cad63c37956e.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoed2e7dca-173b-4828-beab-cad63c37956e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoed2e7dca-173b-4828-beab-cad63c37956e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}