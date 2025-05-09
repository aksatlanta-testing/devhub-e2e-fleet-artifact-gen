
{{- define "go-echoa4c1e7d9-42f2-4315-8607-21a64c7d31ca.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa4c1e7d9-42f2-4315-8607-21a64c7d31ca.fullname" -}}
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


{{- define "go-echoa4c1e7d9-42f2-4315-8607-21a64c7d31ca.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa4c1e7d9-42f2-4315-8607-21a64c7d31ca.labels" -}}
helm.sh/chart: {{ include "go-echoa4c1e7d9-42f2-4315-8607-21a64c7d31ca.chart" . }}
{{ include "go-echoa4c1e7d9-42f2-4315-8607-21a64c7d31ca.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa4c1e7d9-42f2-4315-8607-21a64c7d31ca.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa4c1e7d9-42f2-4315-8607-21a64c7d31ca.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}