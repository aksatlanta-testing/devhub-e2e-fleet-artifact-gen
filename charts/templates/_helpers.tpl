
{{- define "go-echo9229a129-46ce-4057-97fc-5638f95f781c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9229a129-46ce-4057-97fc-5638f95f781c.fullname" -}}
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


{{- define "go-echo9229a129-46ce-4057-97fc-5638f95f781c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9229a129-46ce-4057-97fc-5638f95f781c.labels" -}}
helm.sh/chart: {{ include "go-echo9229a129-46ce-4057-97fc-5638f95f781c.chart" . }}
{{ include "go-echo9229a129-46ce-4057-97fc-5638f95f781c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo9229a129-46ce-4057-97fc-5638f95f781c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo9229a129-46ce-4057-97fc-5638f95f781c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}