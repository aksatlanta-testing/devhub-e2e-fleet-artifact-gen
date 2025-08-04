
{{- define "go-echob40f1936-caa1-4f4e-b466-23eccd6c2b4c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob40f1936-caa1-4f4e-b466-23eccd6c2b4c.fullname" -}}
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


{{- define "go-echob40f1936-caa1-4f4e-b466-23eccd6c2b4c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob40f1936-caa1-4f4e-b466-23eccd6c2b4c.labels" -}}
helm.sh/chart: {{ include "go-echob40f1936-caa1-4f4e-b466-23eccd6c2b4c.chart" . }}
{{ include "go-echob40f1936-caa1-4f4e-b466-23eccd6c2b4c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob40f1936-caa1-4f4e-b466-23eccd6c2b4c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob40f1936-caa1-4f4e-b466-23eccd6c2b4c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}